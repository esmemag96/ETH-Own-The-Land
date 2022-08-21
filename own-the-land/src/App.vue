<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
// import WalletConnect from "@/components/WalletConnect";
import connect from "./composables/connect/index";
import { onMounted } from "vue";

export default {
  name: "App",
  components: {},
  setup: () => {
    const { autoConnect } = connect();
    onMounted(async () => {
      await autoConnect();
    });
  },
};
</script>
