/*global _:true*/
App.ThemesController = Ember.ArrayController.extend({
    selectedTheme: null,

    theme: function() {
        var t = this.get('selectedTheme');
        if (t) {
            return this.store.find('theme', t.id);
        } else {
            return t;
        }
    }.property('selectedTheme'),

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