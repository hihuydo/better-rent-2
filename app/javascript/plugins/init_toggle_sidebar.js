const initToogleSidebar = () => {
  const home = document.getElementById("home");
  const project = document.getElementById("project");
  const property = document.getElementById("property");

  if (home) {
  project.addEventListener( "click", () => {
    $(project).addClass("active").siblings().removeClass("active");
    // $(home).removeClass("active");
    // property.removeClass("active");
    console.log("test");
   });
  home.addEventListener("click", () => {
    $(home).addClass("active").siblings().removeClass("active");
  });
  property.addEventListener("click", () => {
    $(property).addClass("active").siblings().removeClass("active");
  });

};


export { initToogleSidebar };






