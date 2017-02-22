$(document).on 'page:change', ->
  dataLayer.push {
    event: 'virtualPageView'
    virtualPageURL: window.location.href
    virtualPageTitle: $(this).attr('title')
  }

