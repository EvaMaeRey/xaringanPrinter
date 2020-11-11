


slides_pdf <- function(input){

pagedown::chrome_print(input = input)

}

pdf_gif <- function(input,
                    output = paste0(gsub('pdf$', '', input), "gif"),
                    density = 100,
                    delay = NULL
                    ){

# then create gif as follows
images <- magick::image_read_pdf(path = input, density = density) # create images

if (is.null(delay)) {

delay <- (1/(1:length(images))) + .1

}

magick::image_write_gif(images, path = output, delay = delay) # images to gif

}


slides_gif <- function(input,
           output = paste0(gsub('html$', '', input), "gif"),
           density = 100,
           delay = NULL){


pdf <- slides_pdf()

pdf_gif(input = pdf,
        output = output,
        density = density,
        delay = delay)


}

