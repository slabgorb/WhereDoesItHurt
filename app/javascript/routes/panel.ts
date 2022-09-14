const Index = () => import('@/pages/panel/IndexPage.vue');
const Pain = () => import('@/pages/panel/PainPage.vue');
const Therapy = () => import('@/pages/panel/TherapyPage.vue');

const routes = [
  {
    path: '/',
    name: 'index',
    components: {
      default: Index,
    },
  },
  {
    path: '/pain',
    name: 'pain',
    components: {
      default: Pain,
    },
  },
  {
    path: '/therapy',
    name: 'therapy',
    components: {
      default: Therapy,
    },
  },
];

export default routes;
