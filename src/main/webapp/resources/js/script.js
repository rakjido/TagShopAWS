setTimeout(() => {
  document.querySelector('.circle-loader').className = "circle-loader complete";
  document.querySelector('.checkmark').style.display = 'block';
  document.querySelector('.saved').className = "saved complete";
}, 2000)