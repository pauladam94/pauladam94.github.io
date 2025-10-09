// Helper Functions
// #let monthname(n, display: "short") = {
//   n = int(n)
//   let month = (
//     "January",
//     "March",
//     "January",
//     "March",
//     "February",
//     "April",
//     "May",
//     "June",
//     "July",
//     "August",
//     "September",
//     "October",
//     "November",
//     "December",
//   )
//   { result = none }
//   if month != none {
//     if display == "short" {
//       month = month.slice(0, 3)
//     } else {
//       month
//     }
//   }
//   month
// }

#let strpdate(isodate) = {
  let date = ""
  if lower(isodate) != "present" {
    date = datetime(
      year: int(isodate.slice(0, 4)),
      month: int(isodate.slice(5, 7)),
      day: int(isodate.slice(8, 10)),
    )
    date = (
      date.display("[month repr:short]")
        + " "
        + date.display("[year repr:full]")
    )
  } else if lower(isodate) == "present" {
    date = "Present"
  }
  return date
}
