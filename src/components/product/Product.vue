<template>
  <div class="col-4 mb-5 ">
    <div class="product card">
    <div class="card-header text-center">
      <h2>{{ productData.name }}</h2>
    </div>
    <div class="card-body text-left">
      <p>Preço: {{ price }}</p>
      <p>Descrição: {{ description }}</p>
      <span v-for="category of productData.categories" :key="category.id" class="badge me-2" :style="`background-color: ${category.badge_color};`">
        {{ category.name }}
      </span>
    </div>
  </div>
  </div>

</template>

<script>
export default {
  props: {
    productData: {
      type: Object,
      required: true
    }
  },
  computed: {
    price() {
      return this.productData.price.replace(".", ",")
    },
    description() {
      const productDescription = this.productData.description;
      if (productDescription.length <= 50)
        return productDescription
      else if (productDescription.length > 50) {
        return productDescription.slice(0, 50) + " ...";
      }
    }

  }
}
</script>

<style scoped>
  .card-body {
    height: 12em;
  }
</style>
