


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
images <- magick::image_read_pdf(path = input, density = density) %>% # create images
        magick::image_contrast() %>%
        magick::image_modulate(saturation = 125)


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


#' Print Flipbook to Powerpoint
#'
#' @param input Name of the Rmd or html slides file.
#' @return A .pdf, .html, series of .png images, and a .pptx
#' @export
#'
slides_pptx <- function(input){

  filepath_no_ext <- fs::path_ext_remove(input)
  filepath_pdf <- fs::path_ext_set(filepath_no_ext, "pdf")
  filepath_pptx <- fs::path_ext_set(filepath_no_ext, "pptx")

  pagedown::chrome_print(input) # run if have not already created pdf

  screen_imgs <- pdftools::pdf_convert(pdf = filepath_pdf, format = "png", verbose = FALSE)

  doc <- officer::read_pptx()
  for (i in 1:length(input)) {
    doc <- doc %>%
      officer::add_slide(layout = "Blank", master = "Office Theme") %>%
      officer::ph_with(
        value = officer::external_img(screen_imgs[[i]]),
        location = officer::ph_location_fullsize()
      )
  }

  print(doc, filepath_pptx)
  message("You may want to edit 'ratio' in YAML header of input.")
}

