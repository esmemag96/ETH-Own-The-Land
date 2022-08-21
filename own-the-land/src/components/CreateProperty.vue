<template>
  <div class="w-full h-full">
    <div class="flex gap-4">
      <img
        class="flex justify-start w-1/4 items-center"
        src="../assets/images/Logo.png"
        alt="Logo"
      />
    </div>
    <div class="mx-auto w-10/12">
      <h1 class="font-bold text-2xl mb-10">Add new NFT</h1>
      <form class="w-1/2">
        <div class="mb-6">
          <label
            for="tokenId"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Property Token ID</label
          >
          <input
            type="text"
            id="address"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5"
            placeholder="address"
            required=""
          />
        </div>
        <button
          @click="createdAlert"
          type="submit"
          class="text-white bg-red-500 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center"
        >
          Create
        </button>
      </form>
    </div>
  </div>
</template>
<script>
import property from "@/metadata/property.json";

export default {
  data() {
    return {
      property,
    };
  },
  methods: {
    createdAlert() {
      alert("Congratulations you have a new Token");
    },
  },
};
</script>
