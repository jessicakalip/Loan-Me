



const initLabel = () => {
  const tagAll = document.querySelectorAll('.tag')
  // tagAll.forEach((tag) => {
  //   tag.classList.remove("search-label");
  //   tag.classList.add("search-select");
  // });
  tagAll.forEach((tag) => {
    tag.addEventListener("click", (event) => {
       // event.preventDefault();
       event.currentTarget.classList.add("search-select");
    });
  })
};



export { initLabel };


// document.querySelectorAll(".tag").forEach((tag) => {
//   tag.addEventListener("click", (event) => {
//     event.currentTarget.classList.remove("search-label");
//   });
// });
