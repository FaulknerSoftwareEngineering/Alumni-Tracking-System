/* global google */
if(gon.student_details != null) {
	var student_details = gon.student_details;
}

if (gon.ugbyClassAndGen != null) {
	var ugbyClassAndGen = gon.ugbyClassAndGen;
}

if (gon.gabyClassAndGen != null) {
	var gabyClassAndGen = gon.gabyClassAndGen;
}

if (gon.galbyClassAndGen != null) {
	var galbyClassAndGen = gon.galbyClassAndGen;
}

if (gon.galbyClassAndGen != null) {
	var ualbyCollege = gon.ualbyCollege;
}


$(function () {
	var countTotal = 0;
	var countMale = 0;
	var countFemale = 0;
	if (student_details != null) {
		getRegestrationData();
	}
	
	// calculate amount of male and female numbers
	function getRegestrationData() {
		for (var i = 0; i < student_details.length; i++) {
			if (student_details[i].sex == "M") {
				countMale++;
			}
			else {
				countFemale++;
			}

			countTotal = student_details.length;
		}

		buildGenderRaceTable(student_details);
	}

	//This function will iterate through the registrationData array and build
	//the Ethnicity and Gender table.
	function buildGenderRaceTable(data) {
		var raceMale = { raceA: 0, raceB: 0, raceH: 0, raceN: 0, raceP: 0, raceW: 0, raceT: 0, raceO: 0, raceU: 0, raceNR: 0 };
		var raceFemale = { raceA: 0, raceB: 0, raceH: 0, raceN: 0, raceP: 0, raceW: 0, raceT: 0, raceO: 0, raceU: 0, raceNR: 0 };

		for (var i = 0; i < data.length; i++) {
			if (data[i].sex == "M") {
				switch (data[i].race) {
					case "A":
						raceMale.raceA++;
						break;
					case "B":
						raceMale.raceB++;
						break;
					case "H":
						raceMale.raceH++;
						break;
					case "N":
						raceMale.raceN++;
						break;
					case "P":
						raceMale.raceP++;
						break;
					case "W":
						raceMale.raceW++;
						break;
					case "T":
						raceMale.raceT++;
						break;
					case "O":
						raceMale.raceO++;
						break;
					case "U":
						raceMale.raceU++;
						break;
					case "NR":
						raceMale.raceNR++;
					default:
						raceMale.raceU++;
						break;
				}
			}
			else {
				switch (data[i].race) {
					case "A":
						raceFemale.raceA++;
						break;
					case "B":
						raceFemale.raceB++;
						break;
					case "H":
						raceFemale.raceH++;
						break;
					case "N":
						raceFemale.raceN++;
						break;
					case "P":
						raceFemale.raceP++;
						break;
					case "W":
						raceFemale.raceW++;
						break;
					case "T":
						raceFemale.raceT++;
						break;
					case "O":
						raceFemale.raceO++;
						break;
					case "U":
						raceFemale.raceU++;
						break;
					case "NR":
						raceFemale.raceNR++;
					default:
						raceFemale.raceU++;
						break;
				}
			}
		}

		//Trying to figure out how to make this more efficient/less of a pain to look at
		var percMale = {
			percA: calcPercRace(raceMale.raceA, countMale), percB: calcPercRace(raceMale.raceB, countMale), percH: calcPercRace(raceMale.raceH, countMale),
			percN: calcPercRace(raceMale.raceN, countMale), percP: calcPercRace(raceMale.raceP, countMale), percW: calcPercRace(raceMale.raceW, countMale),
			percT: calcPercRace(raceMale.raceT, countMale), percO: calcPercRace(raceMale.raceO, countMale), percU: calcPercRace(raceMale.raceU, countMale),
			percNR: calcPercRace(raceMale.raceNR, countMale)
		};
		var percFemale = {
			percA: calcPercRace(raceFemale.raceA, countFemale), percB: calcPercRace(raceFemale.raceB, countFemale), percH: calcPercRace(raceFemale.raceH, countFemale),
			percN: calcPercRace(raceFemale.raceN, countFemale), percP: calcPercRace(raceFemale.raceP, countFemale), percW: calcPercRace(raceFemale.raceW, countFemale),
			percT: calcPercRace(raceFemale.raceT, countFemale), percO: calcPercRace(raceFemale.raceO, countFemale), percU: calcPercRace(raceFemale.raceU, countFemale),
			percNR: calcPercRace(raceFemale.raceNR, countFemale)
		};
		var percTotal = {
			percA: calcPercRace((raceMale.raceA + raceFemale.raceA), countTotal), percB: calcPercRace((raceMale.raceB + raceFemale.raceB), countTotal), percH: calcPercRace((raceMale.raceH + raceFemale.raceH), countTotal),
			percN: calcPercRace((raceMale.raceN + raceFemale.raceN), countTotal), percP: calcPercRace((raceMale.raceP + raceFemale.raceP), countTotal), percW: calcPercRace((raceMale.raceW + raceFemale.raceW), countTotal),
			percT: calcPercRace((raceMale.raceT + raceFemale.raceT), countTotal), percO: calcPercRace((raceMale.raceO + raceFemale.raceO), countTotal), percU: calcPercRace((raceMale.raceU + raceFemale.raceU), countTotal),
			percNR: calcPercRace((raceMale.raceNR + raceFemale.raceNR), countTotal)
		};

		//Same as chunk above
		var optA = writeTableRowRace('Asian', raceFemale.raceA, percFemale.percA, raceMale.raceA, percMale.percA, percTotal.percA);
		var optB = writeTableRowRace('Black/African American', raceFemale.raceB, percFemale.percB, raceMale.raceB, percMale.percB, percTotal.percB);
		var optH = writeTableRowRace('Hispanic', raceFemale.raceH, percFemale.percH, raceMale.raceH, percMale.percH, percTotal.percH);
		var optN = writeTableRowRace('Native American', raceFemale.raceN, percFemale.percN, raceMale.raceN, percMale.percN, percTotal.percN);
		var optP = writeTableRowRace('Pacific Islander', raceFemale.raceP, percFemale.percP, raceMale.raceP, percMale.percP, percTotal.percP);
		var optW = writeTableRowRace('White', raceFemale.raceW, percFemale.percW, raceMale.raceW, percMale.percW, percTotal.percW);
		var optT = writeTableRowRace('Two or more', raceFemale.raceT, percFemale.percT, raceMale.raceT, percMale.percT, percTotal.percT);
		var optO = writeTableRowRace('Opt out', raceFemale.raceO, percFemale.percO, raceMale.raceO, percMale.percO, percTotal.percO);
		var optU = writeTableRowRace('Unknown/Not reported', raceFemale.raceU, percFemale.percU, raceMale.raceU, percMale.percU, percTotal.percU);
		var optNR = writeTableRowRace('Non-Resident', raceFemale.raceNR, percFemale.percNR, raceMale.raceNR, percMale.percNR, percTotal.percNR);

		var total = writeTableRowRace('Total', countFemale, calcPercRace(countFemale, countTotal), countMale, calcPercRace(countMale, countTotal), calcPercRace(countTotal, countTotal));


		$('#genderEthnicityBody').append(optA);
		$('#genderEthnicityBody').append(optB);
		$('#genderEthnicityBody').append(optH);
		$('#genderEthnicityBody').append(optN);
		$('#genderEthnicityBody').append(optP);
		$('#genderEthnicityBody').append(optW);
		$('#genderEthnicityBody').append(optT);
		$('#genderEthnicityBody').append(optO);
		$('#genderEthnicityBody').append(optU);
		$('#genderEthnicityBody').append(optNR);
		$('#genderEthnicityBody').append(total);
	}

	//Helper function for Ethnicity_Gender table.
	//Calculates what percent the partial amount is of the total.
	function calcPercRace(partial, total) {
		return ((partial / total) * 100).toFixed(1);
	}

	//Helper function for Ethnicity_Gender table.
	//Takes the name of the row and values given to construct the table tow.
	function writeTableRowRace(name, femaleCount, femalePerc, maleCount, malePerc, totalPerc) {
		return '<tr><td>' + name + '</td><td>' + femaleCount + '</td><td>' + femalePerc + '%</td><td>' + maleCount + '</td><td>' + malePerc + '%</td><td>' + (maleCount + femaleCount) + '</td><td>' + totalPerc + '%</td></tr>';
	}


	/*------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------*/



	/*------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------*/

	/*
	 * From here below are functions that require the Google API for charts.
	 * These will be separated from this file in the future for readability
	 * and organization.
	 */

	if (ugbyClassAndGen != null) {
		google.charts.load('current', { 'packages': ['bar'] });
		google.charts.setOnLoadCallback(undergradEnrollmentChart);
		google.charts.setOnLoadCallback(gradEnrollmentChart);
		google.charts.setOnLoadCallback(undergradAdultData);
		google.charts.load('current', { 'packages': ['corechart'] });
		google.charts.setOnLoadCallback(undergradbyCollegeChart);

		//Builds the Enrollment chart for undergraduates.
		//Gets the amount of male and female undergraduates and separates them
		//by year based on the hours completed.
		//This function will take the data from getUndergradData and display it
		//in a Google Bar Graph.
		function undergradEnrollmentChart() {
			var undergradData = getUndergradData(ugbyClassAndGen);
			var maleUGData = undergradData[0];
			var femaleUGData = undergradData[1];

			var chartData = google.visualization.arrayToDataTable([
				['Year', 'Male', 'Female', { role: 'annotation' }],
				['Freshman', maleUGData.freshman, femaleUGData.freshman, ''],
				['Sophomore', maleUGData.sophomore, femaleUGData.sophomore, ''],
				['Junior', maleUGData.junior, femaleUGData.junior, ''],
				['Senior', maleUGData.senior, femaleUGData.senior, '']
			]);

			var options = {
				chartArea: { width: '100%', height: '100%' },
				isStacked: true
			};

			var chart = new google.charts.Bar(document.getElementById('undergradChart'));
			chart.draw(chartData, google.charts.Bar.convertOptions(options));
		}

		//Helper function for undergradEnrollmentChart.
		//This function actually figures out how many male and female undergraduates
		//there are as well as separating them by year based on hours completed.
		function getUndergradData(data) {
			var maleUG = { freshman: 0, sophomore: 0, junior: 0, senior: 0 };
			var femaleUG = { freshman: 0, sophomore: 0, junior: 0, senior: 0 };

			for (var i = 0; i < data.length; i++) {
				if (data[i].program == "TRAD") {
					if (data[i].sex == "M") {
						if (data[i].undergradQualityHours >= 0 && data[i].undergradQualityHours <= 29.9) {
							maleUG.freshman++;
						}
						else if (data[i].undergradQualityHours >= 30 && data[i].undergradQualityHours <= 59.9) {
							maleUG.sophomore++;
						}
						else if (data[i].undergradQualityHours >= 60 && data[i].undergradQualityHours <= 89.9) {
							maleUG.junior++;
						}
						else if (data[i].undergradQualityHours >= 90) {
							maleUG.senior++;
						}
					}

					if (data[i].sex == "F") {
						if (data[i].undergradQualityHours >= 0 && data[i].undergradQualityHours <= 29.9) {
							femaleUG.freshman++;
						}
						else if (data[i].undergradQualityHours >= 30 && data[i].undergradQualityHours <= 59.9) {
							femaleUG.sophomore++;
						}
						else if (data[i].undergradQualityHours >= 60 && data[i].undergradQualityHours <= 89.9) {
							femaleUG.junior++;
						}
						else if (data[i].undergradQualityHours >= 90) {
							femaleUG.senior++;
						}
					}
				}
			}

			var underGrad = [maleUG, femaleUG];

			return underGrad;
		}


		/*------------------------------------------------------------------------*/
		/*------------------------------------------------------------------------*/
		/*------------------------------------------------------------------------*/


		//Builds the graduate enrollment chart.
		//Takes the data gathered from getGradData and builds a Google Bar Graph
		//using that data.
		function gradEnrollmentChart() {
			var gradData = getGradData(gabyClassAndGen);
			var maleGradData = gradData[0];
			var femaleGradData = gradData[1];

			var chartData = google.visualization.arrayToDataTable([
				['Type', 'Male', 'Female', { role: 'annotation' }],
				['Master', maleGradData.master, femaleGradData.master, ''],
				['Docotorate', maleGradData.doctorate, femaleGradData.doctorate, ''],
				['JSL', maleGradData.jsl, femaleGradData.jsl, '']
			]);

			var options = {
				chartArea: { width: '100%', height: '100%' },
				isStacked: true
			};

			var chart = new google.charts.Bar(document.getElementById('gradChart'));

			chart.draw(chartData, google.charts.Bar.convertOptions(options));
		}

		//Helper function for gradEnrollmentChart
		//Figures out how many male and female graduates there are and separates
		//them by the degree they are attempting to get.
		//Returns male and female grad data in an array where the 0th element is
		//male data and the 1st element is female data.
		function getGradData(data) {
			var maleG = { master: 0, doctorate: 0, jsl: 0 };
			var femaleG = { master: 0, doctorate: 0, jsl: 0 };

			for (var i = 0; i < data.length; i++) {
				if (data[i].sex == "M") {
					switch (data[i].majorType) {
						case "M.A.":
							maleG.master++;
							break;
						case "M.B.A.":
							maleG.master++;
							break;
						case "M.ED.":
							maleG.master++;
							break;
						case "M.J.A.":
							maleG.master++;
							break;
						case "M.S.":
							maleG.master++;
							break;
						case "M.S.M.":
							maleG.master++;
							break;
						case "PHD":
							maleG.doctorate++;
							break;
						case "J.D.":
							maleG.jsl++;
							break;
						default:
							break;

					}
				}

				if (data[i].sex == "F") {
					switch (data[i].majorType) {
						case "M.A.":
							femaleG.master++;
							break;
						case "M.B.A.":
							femaleG.master++;
							break;
						case "M.ED.":
							femaleG.master++;
							break;
						case "M.J.A.":
							femaleG.master++;
							break;
						case "M.S.":
							femaleG.master++;
							break;
						case "M.S.M.":
							femaleG.master++;
							break;
						case "PHD":
							femaleG.doctorate++;
							break;
						case "J.D.":
							femaleG.jsl++;
							break;
						default:
							break;
					}
				}
			}

			var grad = [maleG, femaleG];

			return grad;
		}


		/*------------------------------------------------------------------------*/
		/*------------------------------------------------------------------------*/
		/*------------------------------------------------------------------------*/


		function undergradAdultData() {
			var undergradData = getUndergradAdultData(galbyClassAndGen);
			var maleUGData = undergradData[0];
			var femaleUGData = undergradData[1];

			var undergradAdultChart = google.visualization.arrayToDataTable([
				['Year', 'Male', 'Female', { role: 'annotation' }],
				['Freshman', maleUGData.freshman, femaleUGData.freshman, ''],
				['Sophomore', maleUGData.sophomore, femaleUGData.sophomore, ''],
				['Junior', maleUGData.junior, femaleUGData.junior, ''],
				['Senior', maleUGData.senior, femaleUGData.senior, '']
			]);

			var options = {
				chartArea: { width: '100%', height: '100%' },
				isStacked: true
			};

			var chart = new google.charts.Bar(document.getElementById('undergradAdultByClassificatioinGenderChart'));
			chart.draw(undergradAdultChart, google.charts.Bar.convertOptions(options));
		}


		function getUndergradAdultData(data) {
			var maleUG = { freshman: 0, sophomore: 0, junior: 0, senior: 0 };
			var femaleUG = { freshman: 0, sophomore: 0, junior: 0, senior: 0 };

			for (var i = 0; i < data.length; i++) {
				if (isAdultLeaner(data[i].program)) {
					if (data[i].sex == "M") {
						if (data[i].undergradQualityHours >= 0 && data[i].undergradQualityHours <= 29.9) {
							maleUG.freshman++;
						}
						else if (data[i].undergradQualityHours >= 30 && data[i].undergradQualityHours <= 59.9) {
							maleUG.sophomore++;
						}
						else if (data[i].undergradQualityHours >= 60 && data[i].undergradQualityHours <= 89.9) {
							maleUG.junior++;
						}
						else if (data[i].undergradQualityHours >= 90) {
							maleUG.senior++;
						}
					}

					if (data[i].sex == "F") {
						if (data[i].undergradQualityHours >= 0 && data[i].undergradQualityHours <= 29.9) {
							femaleUG.freshman++;
						}
						else if (data[i].undergradQualityHours >= 30 && data[i].undergradQualityHours <= 59.9) {
							femaleUG.sophomore++;
						}
						else if (data[i].undergradQualityHours >= 60 && data[i].undergradQualityHours <= 89.9) {
							femaleUG.junior++;
						}
						else if (data[i].undergradQualityHours >= 90) {
							femaleUG.senior++;
						}
					}
				}
			}
			var underGrad = [maleUG, femaleUG];

			return underGrad;
		}

		/*------------------------------------------------------------------------*/
		/*------------------------------------------------------------------------*/
		/*------------------------------------------------------------------------*/

		//Helper function for Undergraduate Adult Learners by College Chart
		function undergradbyCollegeChart() {
			var undergradData = getundergradbyCollegeChart(ualbyCollege);

			var data = google.visualization.arrayToDataTable([
				['College', 'Student Enrollment'],
				['College of Arts and Sciences', undergradData.artsAndScience],
				['College of Bible', undergradData.bible],
				['College of Business', undergradData.business],
				['College of Education', undergradData.education]
			]);

			var options = {
				chartArea: { width: '100%', height: '100%' },
				is3D: true
			};

			var chart = new google.visualization.PieChart(document.getElementById('undergradAdultByCollegeChart'));
			chart.draw(data, options);

		}

		function getundergradbyCollegeChart(data) {
			var collegedata = { artsAndScience: 0, bible: 0, business: 0, education: 0 };

			for (var i = 0; i < data.length; i++) {
				if (isAdultLeaner(data[i].program)) {
					switch (data[i].name) {
						case "College of Arts and Sciences":
							collegedata.artsAndScience++;
							break;
						case "College of Bible":
							collegedata.bible++;
							break;
						case "College of Business":
							collegedata.business++;
							break;
						case "College of Education":
							collegedata.education++;
							break;
						default:
							break;
					}
				}
			}

			return collegedata
		}

		function isAdultLeaner(data) {
			data = "AA" || "ALDT" || "BBA" || "BCJ" || "BHUM" || "BSB" || "EBCJ" || "HRM" || "XPCO"
			return true;
		}
	}
	
});