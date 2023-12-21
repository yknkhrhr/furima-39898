const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = Math.floor(inputValue * 0.1);
  const total = inputValue - tax;

  addTaxDom.innerHTML = tax;
  profitDom.innerHTML = total;
});