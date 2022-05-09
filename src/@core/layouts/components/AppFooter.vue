<template>
  <p class="clearfix mb-0">
    <span class="float-md-left d-block d-md-inline-block mt-25">
      COPYRIGHT © {{ new Date().getFullYear() }}
      <b-link class="ml-25" href="https://www.arvas.com.tr/" target="_blank"
        >Arvas</b-link
      >
      <span class="d-none d-sm-inline-block"> , Tüm Hakları Saklıdır</span>
    </span>
  </p>
</template>

<script>
import { BLink } from "bootstrap-vue";

export default {
  components: {
    BLink,
  },
};
</script>
