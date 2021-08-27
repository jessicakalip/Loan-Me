
const scrollingTab = () => {
  const tab = document.querySelector('.hangout');
  const reqTab = document.querySelector('.request');
  const el = document.querySelector('#myTabContent');
  tab.addEventListener("click", () => {
      el.scrollIntoView(true);
  });
  reqTab.addEventListener("click", () => {
      el.scrollIntoView(true);
  });
};

export { scrollingTab };
