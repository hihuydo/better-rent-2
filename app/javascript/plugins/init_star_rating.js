// app/javascript/plugins/init_star_rating.js
import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#vote_vote_location').barrating({
    theme: 'css-stars'
  });
  $('#vote_vote_price').barrating({
    theme: 'css-stars'
  });
  $('#vote_vote_size').barrating({
    theme: 'css-stars'
  });
};



export { initStarRating };