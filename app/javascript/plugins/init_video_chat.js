// import DailyIframe from '@daily-co/daily-js';
// let callFrame = DailyIframe.wrap(ENV['MY_IFRAME']);

// callFrame = window.DailyIframe.createFrame({
//   showLeaveButton: true,
//   iframeStyle: {
//     position: 'fixed',
//     width: '100%',
//     height: '100%'
//   }
// });



// const initVideoChat = () => {
//   const windowButton = document.getElementById("mgtJoin");
//   windowButton.addEventListener('click', openWindow);
//   function openWindow() {
//     let callUrl = 'https://better-rent.daily.co/property_viewing';
//     callFrame = window.DailyIframe.createFrame({
//     showLeaveButton: true,
//   });
//     callFrame.join({ url: 'https://better-rent.daily.co/property_viewing' });
//   };
// }

// export { initVideoChat };



// function mtgJoin() {
//   let callUrl = 'https://better-rent.daily.co/property_viewing';
//   if (!window.frame) {
//     window.inp = document.getElementById('mtg-link');
//     window.frame = window.DailyIframe.createFrame(
//     document.getElementById('mtg-frame')
//     );
//     }
//   window.frame.join({ url: callUrl });
//     }
//   function mtgLeave() {
//     window.frame.leave();
//   }