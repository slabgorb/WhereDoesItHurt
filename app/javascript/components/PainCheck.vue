<template>
    <v-card>
        <v-card-title>Pain Check</v-card-title>
        <v-card-subtitle>record your current pain level</v-card-subtitle>
        <canvas ref="painRecord" class="pain-record">
        </canvas>
    </v-card>
</template>


<style scoped>
    .pain-record {
        width: 500px;
        height: 500px;
        background-position: top;
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>

<script setup lang="ts">

import imgUrl from '@/assets/images/pain_chart.jpg'
import { onMounted, ref } from 'vue';
const painRecord = ref<HTMLCanvasElement>();
let prevX :number, prevY :number, currX :number, currY :number;
prevX = prevY = currX = currY = 0;
let flag = false;
let dotFlag = false;
onMounted(() => {
    if (painRecord != null && painRecord.value != null) {
        const canvas = painRecord.value;
        canvas.addEventListener("mousemove", function (e) {
            findxy(canvas,'move', e)
        }, false);
        canvas.addEventListener("mousedown", function (e) {
            findxy(canvas,'down', e)
        }, false);
        canvas.addEventListener("mouseup", function (e) {
            findxy(canvas,'up', e)
        }, false);
        canvas.addEventListener("mouseout", function (e) {
            findxy(canvas,'out', e)
        }, false);
        painRecord.value.style.backgroundImage = `url(${imgUrl})`;
    }
})

function draw(ctx: CanvasRenderingContext2D) {
    ctx.beginPath();
    ctx.moveTo(prevX, prevY);
    ctx.lineTo(currX, currY);
    ctx.strokeStyle = "red";
    ctx.lineWidth = 2;
    ctx.stroke();
    ctx.closePath();
}

function findxy(canvas: HTMLCanvasElement, res :string, e :MouseEvent) {
    const ctx = canvas.getContext("2d");
    if (ctx == null) {
        return;
    }
    if (res == 'down') {
        prevX = currX;
        prevY = currY;
        currX = e.clientX - canvas.offsetLeft;
        currY = e.clientY - canvas.offsetTop;
        console.log(ctx);
        flag = true;
        dotFlag = true;
        if (dotFlag && ctx) {
            ctx.beginPath();
            ctx.fillStyle = 'red';
            ctx.fillRect(currX, currY, 2, 2);
            ctx.closePath();
            dotFlag = false;
        }
    }
    if (res == 'up' || res == "out") {
        flag = false;
    }
    if (res == 'move') {
        if (flag) {
            prevX = currX;
            prevY = currY;
            currX = e.clientX - canvas.offsetLeft;
            currY = e.clientY - canvas.offsetTop;
            draw(ctx);
        }
    }
}


const internalityList = [
    {
        value: 0,
        label: "internal",
    },
    {
        value: 1,
        label: "external",
    },
];

const sensationList = [
    {
        value: 0,
        label: "sharp",
    },
    {
        value: 1,
        label: "dull",
    },
    {
        value: 2,
        label: "burning",
    },
    {
        value: 3,
        label: "tingling",
    },
    {   value: 4,
        label: "numbness",
    },
    {   value: 5,
        label: "other",
    },
];

const sensation = ref('');
const internality = ref(0);

</script>

