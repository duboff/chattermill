/*global _:true*/
App.ThemesController = Ember.ArrayController.extend({
    selectedTheme: null,

    /**
     * Topic selected on the word cloud by user. This property is used in topic details component
     * @property topic
     * @type {Object}
     */
    theme: function() {
        return this.get('selectedTheme');
    }.property('selectedTheme'),

    /*
     * Load the topics from fixtures and transform each item in a ember object.
     * @method generateTopics
     * @return {Array} Returns topics
     */
    generateThemes: function() {
      var topics = this.get('content.content');

      if (!topics || _.isEmpty(topics)) {
        return topics;
        }
      var bla = topics.map( function(theme) {
        return Ember.Object.create(theme.get('data'));
        });
      return bla;
    },

    themes: function() {
        var topics = this.generateThemes();
        
        if (topics) {
            topics = topics.map(function(topic) {
                return _.pick(topic, ['body', 'sentimentScore', 'id', 'weight']);
            });
        }
        return topics;
    }.property('@each.body', '@each.sentimentScore', '@each.id', '@each.weight'),

    actions: {
        setSelectedTheme: function(theme) {
          this.set('selectedTheme', theme);
        }
    }
});