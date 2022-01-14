<template>
  <div class="product">
    <div>
      <h2>{{ productData.name }}</h2>
    </div>
    <div>
      <ul>
        <li>Preço: {{ productData.price }}</li>
        <li>Descrição: {{ productData.description }}</li>
      </ul>
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
  }
}
</script>

<style scoped>

</style>
