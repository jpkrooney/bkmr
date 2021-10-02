.onAttach <- function(libname, pkgname) {
  packageStartupMessage("For guided examples, go to 'https://jenfb.github.io/bkmr/overview.html'")
}

release_questions <- function() {
  c(
    "Have you updated the vignette and posted to GitHub?"
  )
}

.onLoad <- function(libname, pkgname) {
  julia_setup(installJulia=TRUE)
  #julia_setup(JULIA_HOME = "/Applications/Julia-1.6.3.app/Contents/Resources/julia/bin/")
  
  julia_install_package_if_needed("Tullio")
  julia_install_package_if_needed("LoopVectorization")
  
  # load julia packages
  julia_library("Tullio")
  julia_library("LoopVectorization")
  
  # load bkmr julia functions
  julia_source(system.file("julia/makeKpart.jl", package = "bkmr"))
  
  # support transfer to Float32
  julia_command("import RCall.rcopytype; rcopytype(::Type{RCall.RClass{:JuliaFloat32}}, x::Ptr{RealSxp}) = Array{Float32}")

}