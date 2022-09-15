<template>
  <v-card>
    <v-card-title>Pain Check</v-card-title>
    <v-card-subtitle>record your current pain level</v-card-subtitle>
    <canvas ref="painRecord" class="pain-record">
    </canvas>
    <v-select :items="sensationList" v-model="sensation" label="sensation" />
    <v-rating v-model="painLevel" label="pain level" length=9
      :item-labels=painLevels />
    <v-chip>{{ painLevels[painLevel % 2 == 1 ? painLevel - 1 : painLevel] }}
    </v-chip>
    <v-radio-group v-model="internality" label="internal or external pain?">
      <v-radio label="internal" value="0" />
      <v-radio label="external" value="1" />
    </v-radio-group>
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
const painLevel = ref(1);
const sensation = ref('');
const internality = ref(0);

const painLevels = ['no pain', '', 'mild', '', 'moderate', '', 'severe', '', 'very severe', '', 'unendurable'];

let currentlyPainting = false;
let context: CanvasRenderingContext2D | null = null;

function getMousePos(canvas: HTMLCanvasElement, evt: MouseEvent) {
  var rect = canvas.getBoundingClientRect();
  return {
    x: (evt.clientX - rect.left) / (rect.right - rect.left) * canvas.width,
    y: (evt.clientY - rect.top) / (rect.bottom - rect.top) * canvas.height
  };
}

onMounted(() => {
  const canvas = painRecord.value!;
  if (canvas == null) {
    return;
  }
  canvas.addEventListener("mousemove", function (e) {
    if (currentlyPainting) {
      draw(e);
    }
  }, false);
  canvas.addEventListener("mousedown", function (e) {
    currentlyPainting = true;
  }, false);
  canvas.addEventListener("mouseup", function (e) {
    currentlyPainting = false;
  }, false);
  canvas.style.backgroundImage = `url(${imgUrl})`;
  context = painRecord.value!.getContext('2d');
});

const cursorSize = ref(4);

function draw(evt: MouseEvent) {
  const canvas = painRecord.value!;
  var pos = getMousePos(canvas, evt);
  const offset = cursorSize.value / 2;
  context!.fillStyle = "#000000";
  context!.fillRect(pos.x - offset, pos.y - offset, cursorSize.value, cursorSize.value);
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

const sensationList = ['sharp', 'dull', 'burning', 'tingling', 'numbness', 'itchy', 'throbbing', 'cramping', 'stabbing', 'squeezing', 'twitching', 'stinging', 'aching', 'crushing', 'pulling', 'tugging', 'stiff', 'heavy', 'tender', 'sore', 'raw']


</script>

