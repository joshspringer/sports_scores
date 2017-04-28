document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      scores: [],
      newHomeTeam: '',
      newHomeTeamScore: '',
      newAwayTeam: '',
      newAwayTeamScore: '',
      errors: []
    },
    mounted: function() {
      console.log('mounted');
      $.get("/api/v2/scores", function(response) {
        console.log(response);
        console.log(this.scores);
        this.scores = response;
        console.log(this.scores);
      }.bind(this));
    },
    methods: {
      // addScore: function() {
      //   console.log('add person');
      //   var parameters = {
      //     homeTeam: this.newHomeTeam,
      //     homeTeamScore: this.newHomeTeamScore,
      //     awayTeam: this.newAwayTeam,
      //     awayTeamScore: this.newAwayTeamScore,
      //   };
      //   $.post("/api/v2/scores", function(response) {
      //     this.scores.push(response);
      //     homeTeam: this.newHomeTeam = '';
      //     homeTeamScore: this.newHomeTeamScore = '';
      //     awayTeam: this.newAwayTeam = '';
      //     awayTeamScore: this.newAwayTeamScore = '';
      //   }.bind(this));
        // .fail(function(responseError) {
        //   console.log('fail');
        //   console.log(responseError.responseJSON.errors);
        //   this.errors = responseError.responseJSON.errors;
        // }.bind(this));
    }
  });
});

