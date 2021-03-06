const initVideoChat = () => {
  const windowButton = document.getElementById("chat-window");
  windowButton.addEventListener('click', openWindow);
  function openWindow() {
    callFrame = window.DailyIframe.createFrame({
    showLeaveButton: true,
  });
    callFrame.join({ url: 'https://better-rent.daily.co/property_viewing' });
  };
}

export { initVideoChat };

