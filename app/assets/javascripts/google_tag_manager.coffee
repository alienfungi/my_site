jQuery ->
  $(document).on 'page:change', ->
    dataLayer.push {
      'event': 'pageView',
      'virtualUrl': window.location.href
    }
