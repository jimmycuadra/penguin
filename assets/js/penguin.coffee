$ ->
  window.Penguin =
    init: ->
      @deck.show(@deck.currentSlide)
      $(document).on("keyup", @deck.changeSlide.bind(@deck))

    deck:
      slides: $(".slide")

      currentSlide: 0

      show: (index) ->
        @slides.removeClass("current")
        @slides.eq(index).addClass("current")

      changeSlide: (event) ->
        switch event.keyCode
          when 37
            return if @currentSlide is 0
            @currentSlide -= 1
            @show(@currentSlide)
          when 39
            return if @currentSlide is @slides.length - 1
            @currentSlide += 1
            @show(@currentSlide)

  Penguin.init()
