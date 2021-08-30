
const scrollingTab = () => {
  const tab = document.querySelector('.hangout');
  const reqTab = document.querySelector('.request');
  const el = document.querySelector('#myTabContent');
  if (tab) {
    tab.addEventListener("click", () => {
        el.scrollIntoView(true);
    });
  };
  if (reqTab) {
    reqTab.addEventListener("click", () => {
        el.scrollIntoView(true);
    });
  };
};

export { scrollingTab };
