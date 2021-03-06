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
            maxWeight,
            wordScale;

        if (!themes || _.isEmpty(themes)) {
            return;
        }

        //Get the theme with maximum sentiment score
        maxWeight = _.max(themes, function(theme) { return theme.weight; }).weight;

        //Create one scale linear for calculate words size based on its sentiment score
        wordScale = d3.scale.linear().domain([0, maxWeight]).range([20, 40, 60, 80, 100]);

        //Map themes in order to get only some attributes
        themes = themes.map(function(theme) {
            return { text: theme.body,
                     size: wordScale(theme.weight),
                     sentimentScore: theme.sentimentScore,
                     id: theme.id
                  };
        });

        //Config word cloud
        d3.layout.cloud()
            .size([960, 600])
            .timeInterval(10)
            .padding(3)
            .font("Helvetica")
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
                .attr("width", 800)
                .attr("height", 600)
                .append("g")
                    .attr("transform", "translate(300,300)")
                .selectAll("text")
                    .data(words)
                .enter().append("text")
                    .style("font-size", function(d) { return d.size + "px"; })
                    .style("font-family", "Helvetica")
                    .style("cursor", "pointer")
                    .style("fill", function(d) { return that.getColorBySentiment(d.sentimentScore); })
                    .attr("text-anchor", "middle")
                    .attr("class", "theme")
                    .attr("transform", function(d) {
                        return "translate(" + [d.x, d.y] + ")rotate(" + 0 + ")";
                    })
                    .text(function(d) { return d.text; })
                .on("click", function(d) {
                    that.get('themesController').send('setSelectedTheme', d);
                });
        }
    }.observes('data'),

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
