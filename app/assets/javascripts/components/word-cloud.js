/* global d3:true*/ /* global _:true */

App.WordCloudComponent = Ember.Component.extend({

    /**
     * Generate a word cloud when render the component
     * @method didInsertElement
     */
    didInsertElement: function() {
      this.generateWordCloud();
    },

    /**
     * Generate a word cloud. Get themes passed to component and use the D3 library to generate the word cloud with these themes.
     * @method generateWordCloud
     */
    generateWordCloud: function() {
        var that = this,
            themes = this.get('data'),
            maxScore,
            wordScale;

        if (!themes || _.isEmpty(themes)) {
            return;
        }

        //Get the theme with maximum sentiment score
        maxScore = _.max(themes, function(theme) { return theme.sentimentScore; }).sentimentScore * 100;

        //Create one scale linear for calculate words size based on its sentiment score
        wordScale = d3.scale.linear().domain([0, maxScore]).range([0, 50, 100]);

        //Map themes in order to get only some attributes
        themes = themes.map(function(theme) {
            return { text: theme.body,
                     size: wordScale(theme.sentimentScore) * 50,
                     sentimentScore: theme.sentimentScore * 100
                  };
        });

        //Config word cloud
        var fontSize = d3.scale.log().range([10, 100]);

        d3.layout.cloud()
            .size([960, 600])
            .timeInterval(10)
            .padding(2)
            .font("Impact")
            .fontSize(function(d) { return d.size; })
            .words(themes)
            .on("end", draw)
            .start();

        //Render word cloud
        function draw(words) {
            var svg = $('#word-cloud-themes');
            svg.remove();
            d3.select("body .col-md-8")
                .append("svg")
                .attr("id", "word-cloud-themes")
                .attr("width", 960)
                .attr("height", 600)
                .append("g")
                .attr("transform", "translate(300,300)")
                .selectAll("text")
                .data(words)
                .enter().append("text")
                .style("font-size", function(d) { return d.size + "px"; })
                .style("font-family", "Helvetica")
                .style("fill", function(d) { return that.getColorBySentiment(d.sentimentScore); })
                .attr("text-anchor", "middle")
                .attr("transform", function(d) {
                    return "translate(" + [d.x, d.y] + ")rotate(" + 0 + ")";
                })
                .text(function(d) { return d.text; })
                .on("click", function(d) {
                    that.get('themesController').send('setSelectedTheme', d);
                });
        }
    }.observes('data'),

    /**
     * Get color according to sentiment score
     * @method getColorBySentiment
     * @param sentiment score
     * @returns {string} color
     */
    getColorBySentiment: function(sentimentScore) {
        if (sentimentScore > 0) {
            return "green";
        } else if (sentimentScore < 0) {
            return "red";
        } else {
            return "gray";
        }
    }
});
