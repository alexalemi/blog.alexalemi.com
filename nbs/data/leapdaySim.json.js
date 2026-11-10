
import * as d3 from "d3";

const n = 25_000;
const totalBirths = 62187024;
const totalDays = 5475 + 4;
const leaplings = 41869;
const leapDays = 4;
const nonLeapDays = totalDays - leapDays;
const nonLeaplings = totalBirths - leaplings;

function estimateRate(leaplings) {
	const nonLeaplings = totalBirths - leaplings;
	return ((nonLeaplings / nonLeapDays) * 1460) / (leaplings / leapDays);
}

const trial = d3.randomBinomial(totalBirths, leapDays/totalDays);

function simulate() {
	return estimateRate(trial())
}

const results = Float64Array.from({length: n}, simulate)

// One decimal is far finer than the histogram bins, and cuts the file ~4x.
process.stdout.write(JSON.stringify(Array.from(results, (x) => Math.round(x * 10) / 10)));
