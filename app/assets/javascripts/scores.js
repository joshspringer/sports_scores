document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      scores: [],
      newHomeTeam: '',
      newHomeTeamScore: '',
      newAwayTeam: '',
      newAwayTeamScore: '',
      errors: [],
      teamSearch: '',
      sortAttribute: 'home_team_score',
      sortAsc: true
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
      addScore: function() {
        console.log('add score');
        var parameters = {
          home_team: this.newHomeTeam,
          home_team_score: this.newHomeTeamScore,
          away_team: this.newAwayTeam,
          away_team_score: this.newAwayTeamScore,
        };
        $.post("/api/v2/scores", parameters, function(response) {
          console.log(response);
          this.scores.push(response);
          this.newHomeTeam = '';
          this.newHomeTeamScore = '';
          this.newAwayTeam = '';
          this.newAwayTeamScore = '';
        }.bind(this)).fail(function(responseError) {
          console.log('fail');
          console.log(responseError.responseJSON.errors);
          this.errors = responseError.responseJSON.errors;
        }.bind(this));
      },
      isTeam: function(team) {
        return team.toLowerCase().includes(this.teamSearch.toLowerCase());
      },
      changeSortAttribute: function(inputAttribute) {
        console.log('changing sort attribute');
        this.sortAttribute = inputAttribute;
        this.sortAsc = !this.sortAsc;
      },
      changeSortDirection: function(inputDirection) {
        console.log('changing sort direction');
      }
    },
    computed: {
      modifiedScores: function() {
        console.log(this.scores);
        return this.scores.sort(function(score1, score2) {
          console.log(score1[this.sortAttribute], score2[this.sortAttribute]);
          console.log(score1[this.sortAttribute] > score2[this.sortAttribute]);
          if (this.sortAsc) {
            return score1[this.sortAttribute] < score2[this.sortAttribute];
          } else {
            return score1[this.sortAttribute] > score2[this.sortAttribute];
          }
        }.bind(this));
      }
    }
  });
});

