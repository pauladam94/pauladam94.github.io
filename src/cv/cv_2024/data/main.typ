#import "../cv.typ": *

#let cvdata = yaml("main.yml")

#let uservars = (
    headingfont: "Linux Libertine",
    bodyfont: "Linux Libertine",
    fontsize: 10pt, // 10pt, 11pt, 12pt
    linespacing: 6pt,
    showAddress: true, // true/false show address in contact info
    showNumber: true,  // true/false show phone number in contact info
    headingsmallcaps: false
)

#let customrules(doc) = {
    // add custom document style rules here
    set page(
        paper: "us-letter", // a4, us-letter
        numbering: none, // "1 - 1"
        number-align: center, // left, center, right
        margin: 1.25cm, // 1.25cm, 1.87cm, 2.5cm
    )

    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}

// each section body can be overridden by re-declaring it here
// #let cveducation = []

// ========================================================================== //

#show: doc => cvinit(doc)

#cvheading(cvdata, uservars)
#cvprojects(cvdata)
#cvwork(cvdata)
#cveducation(cvdata)
// #cvaffiliations(cvdata)

// #cvawards(cvdata)
// #cvcertificates(cvdata)
// #cvpublications(cvdata)
#cvskills(cvdata)

// #cvreferences(cvdata)
#endnote()