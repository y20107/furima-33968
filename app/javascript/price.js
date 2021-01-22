function price (){
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  priceInput.addEventListener('keyup', () => {
    const priceVal = priceInput.value;
    const taxNum = (Math.floor(priceVal / 10));
    const profitNum = (Math.floor(priceVal - taxNum))
    taxPrice.innerHTML = taxNum.toLocaleString();
    profit.innerHTML = profitNum.toLocaleString();
  });
}

window.addEventListener('load', price);