const main = () => {
  document.querySelectorAll('.calendar-day-list > .calendar-list-header').forEach($el => {
    const $div = $el.nextSibling
    const $a = $div.querySelector('.list-card-title')

    $a.childNodes.forEach($child => {
      if ($child.nodeType === 3) {
        const $span = document.createElement('span')
        $span.className = 'list-card-title__span'
        $span.appendChild($child)
        $a.appendChild($span)
      }
    })

    $a.appendChild($el)
  })
}

setInterval(main, 5000);
