<template>
  <div>
    <b-container class="bv-example-row mb-3">
      <b-row cols="6">
        <b-col v-for="item in room" :key="item" cols-lg="6" class="m-2">
          <b-card
            title="Create Awesome 🙌"
            bg-variant="primary"
            text-variant="white"
          >
            <b-card-text>This is your second page.</b-card-text>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import { BCardGroup, BCard, BCardText, BContainer, BRow } from "bootstrap-vue";

export default {
  data: () => ({
    room: 12,
  }),
  components: {
    BCard,
    BCardGroup,
    BCardText,
    BContainer,
    BRow,
  },
};
</script>

<style></style>
