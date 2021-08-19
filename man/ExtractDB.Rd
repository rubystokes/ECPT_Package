\name{ExtractDB}
\alias{ExtractDB}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
ExtractDB
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ExtractDB(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
    tbl(SLAS2, "Per_Cell") \%>\% left_join(tbl(SLAS2, "Per_Image")) \%>\%
        select(Img_N = ImageNumber, Experiment = Image_Metadata_Experiment,
            Img_Nuclei_N = Image_Count_Nuclei, Cell_Type = Image_Metadata_Cell,
            Treatment = Image_Metadata_Treatment, Replicate = Image_Metadata_Replicate,
            Well = Image_Metadata_Well, Cell_N = Cell_Number_Object_Number,
            Cell_VEC_MeanI = Cell_Intensity_MeanIntensity_VECOrig) \%>\%
        collect() \%>\% cbind(tbl(SLAS2, "Cell_ActCl") \%>\% select(Cell_Act_Cl = class) \%>\%
        collect()) \%>\% cbind(tbl(SLAS2, "Per_CellJunctArea") \%>\%
        select(Junct_VEC_MeanI = CellJunctArea_Intensity_MeanIntensity_VECOrig) \%>\%
        collect()) \%>\% cbind(tbl(SLAS2, "Per_CellsObj") \%>\% select(Cell_NCheck = CellsObj_Number_Object_Number,
        Cell_Area = CellsObj_AreaShape_Area, Cell_Perim = CellsObj_AreaShape_Perimeter,
        Cell_MaxL = CellsObj_AreaShape_MajorAxisLength, Cell_MinL = CellsObj_AreaShape_MinorAxisLength,
        Cell_Orientation = CellsObj_AreaShape_Orientation, Cell_Neighbour_N = CellsObj_Neighbors_NumberOfNeighbors_Expanded,
        Cell_1st_Nb_Dist = CellsObj_Neighbors_FirstClosestDistance_Expanded,
        Cell_2nd_Nb_Dist = CellsObj_Neighbors_SecondClosestDistance_Expanded,
        Perc_Touch = ) \%>\% collect()) \%>\% cbind(tbl(SLAS2, "Per_Nuclei") \%>\%
        select(Nu_X = Nuclei_Location_Center_X, Nu_Y = Nuclei_Location_Center_Y,
            DNA_IntI = Nuclei_Intensity_IntegratedIntensity_Nuclei,
            Nu_Clustering = Nuclei_Neighbors_NumberOfNeighbors_20,
            Nu_1st_Nb_Dist = Nuclei_Neighbors_FirstClosestDistance_20,
            Nu_2nd_Nb_Dist = Nuclei_Neighbors_SecondClosestDistance_20,
            Nu_Area = Nuclei_AreaShape_Area) \%>\% collect()) \%>\%
        cbind(tbl(SLAS2, "Per_NDotsCy") \%>\% select(Cy_NCH_IntI = NDotsCy_Intensity_IntegratedIntensity_NOTCH) \%>\%
            collect()) \%>\% cbind(tbl(SLAS2, "Per_NDotsNu") \%>\%
        select(Nu_NCH_IntI = NDotsNu_Intensity_IntegratedIntensity_NOTCH) \%>\%
        collect()) \%>\% cbind(tbl(SLAS2, "Per_CellsObj") \%>\% select(Stb_J_N = CellsObj_Children_Stb_Count,
        Lin_J_N = CellsObj_Children_Lin_Count, Jag_J_N = CellsObj_Children_Jag_Count,
        NaJ_J_N = CellsObj_Children_NaJ_Count) \%>\% collect())
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
