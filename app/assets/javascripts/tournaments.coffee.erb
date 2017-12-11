$ ->
  $.ajaxSetup beforeSend: (xhr) ->
    xhr.setRequestHeader 'X-CSRF-Token', 
      $('meta[name="csrf-token"]').attr('content')

  $('button').click (event) ->
    event.preventDefault()
    t = event.target
    number = $('article[data-number="' + event.target.dataset.id + '"] |
      .participants-number')[0]
    if t.dataset.participates == 'true'
      $.ajax
        url: '/tournaments/' + t.dataset.id
        type: 'DELETE'
        success: ->
          number.innerText = parseInt(number.innerText) - 1
          t.dataset.participates = false
          t.innerText = "Participate"
          t.classList.remove('btn-secondary')
          t.classList.add('btn-primary')
        timeout: 3000
    else
      $.ajax
        url: '/tournaments/' + t.dataset.id
        type: 'POST'
        success: ->
          number.innerText = parseInt(number.innerText) + 1
          t.dataset.participates = true
          t.innerText = "Don't participate"
          t.classList.remove('btn-primary')
          t.classList.add('btn-secondary')
        timeout: 3000
