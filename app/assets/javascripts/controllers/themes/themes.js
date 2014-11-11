/*global _:true*/
App.ThemesController = Ember.ArrayController.extend({
    needs: 'project',
    selectedTopic: null,

    /**
     * Topic selected on the word cloud by user. This property is used in topic details component
     * @property topic
     * @type {Object}
     */
    topic: function() {
        return this.get('selectedTopic');
    }.property('selectedTopic'),

    /*
     * Load the topics from fixtures and transform each item in a ember object.
     * @method generateTopics
     * @return {Array} Returns topics
     */
    generateTopics: function() {
     
      var topics = this.get('content.content');

      if (!topics || _.isEmpty(topics)) {
            return topics;
        }

      var bla = topics.map( function(theme) {
          
          return Ember.Object.create(theme.get('data'));
        });
      return bla;
    },

    /**
     * Topics loaded from fixtures
     * @property topics
     * @type {Object} Returns topics
     */
    themes: function() {
        var topics = this.generateTopics()
        
        if (topics) {
            topics = topics.map(function(topic) {
                return _.pick(topic, ['body', 'sentimentScore']);
            });
        }

        return topics;
    }.property('@each.body', '@each.sentimentScore'),

    actions: {
        /**
         * Set selected topic
         * @method setSelectedTopic
         * @param {Object} selected topic
         */
        setSelectedTopic: function(topic) {
            this.set('selectedTopic', topic);
        }
    }
});
