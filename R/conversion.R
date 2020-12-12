


slides_pdf <- function(input){

  for (i in 1:length(input)){
pagedown::chrome_print(input = input[i])
  }

  pdftools::pdf_combine(input = stringr::str_replace(input, ".html", ".pdf"),
                        output = "slides_combined.pdf")

}


pdf_gif <- function(input,
                    output = paste0(gsub('pdf$', '', input), "gif"),
                    density = 200,
                    delay = .5
                    ){

# then create gif as follows
images <- magick::image_read_pdf(path = input, density = density) # create images


magick::image_write_gif(images, path = output, delay = delay) # images to gif

}


pdf_video <- function(input,
                    output = paste0(gsub('pdf$', '', input), ".mp4"),
                    density = 200,
                    delay = .5
){

  # then create gif as follows
  images <- magick::image_read_pdf(path = input, density = density) # create images


  magick::image_write_video(images, path = output, delay = delay) # images to gif

}



#' Title
#'
#' @param input name of the html slides file
#' @param output name of the gif
#' @param density resolution maybe
#' @param delay time frame is displayed in seconds
#'
#' @return a pdf and a gif
#' @export
#'
#' @examples
#'
slides_gif <- function(input,
           output = paste0(gsub('html$', '', input), "gif"),
           density = 200,
           delay = .5){

slides_pdf(input = input)

pdf_gif(input = "slides_combined.pdf",
        output = output,
        density = density,
        delay = delay)

}




slides_video <- function(input,
                       output = paste0(gsub('html$', '', input), "mp4"),
                       density = 200,
                       delay = .5){


  pdf <- slides_pdf(input = input)

  pdf_video(input = pdf,
          output = output,
          density = density,
          delay = delay)


}




