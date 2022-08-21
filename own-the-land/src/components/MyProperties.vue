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
      <div class="flex justify-between gap-x-6">
        <h1 class="font-bold text-2xl mb-10">Recently Added</h1>
        <router-link
          :to="{ name: 'CreateProperty' }"
          class="bg-red-500 rounded-lg text-white h-12 py-2 px-6 text-lg"
        >
          <span class=""> Create NFT </span>
        </router-link>
      </div>
      <router-link
        :to="{ name: 'TransferProperty' }"
        class="flex flex-col items-center bg-white rounded-lg border shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 mb-4"
      >
        <img
          class="object-cover w-full h-96 rounded-t-lg md:h-auto md:w-48 md:rounded-none md:rounded-l-lg"
          src="../assets/images/Casa.png"
          alt=""
        />
        <div class="flex flex-col justify-between p-4 leading-normal">
          <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900">
            {{ property.alcaldia }}, {{ property.colonia }}
          </h5>
          <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
            {{ property.geopoint }}
          </p>
        </div>
      </router-link>
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
};
</script>
