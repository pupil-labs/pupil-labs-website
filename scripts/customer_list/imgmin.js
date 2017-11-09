#!/usr/local/env node

const fs = require('fs');
const path = require('path');
const globby = require('globby')
const sharp = require('sharp')
// const imagemin = require('imagemin');


var company_dir = '../../contents/media/images/home/customers/companies/';
var academic_dir = '../../contents/media/images/home/customers/academic/';
var company_dist = company_dir + 'dist/';
var academic_dist = academic_dir + 'dist/'

// remove dist folder
rmDir = function(dirPath) {
  try { 
  	var files = fs.readdirSync(dirPath);
  }
  catch(e) { 
  	return; 
  }
  if (files.length > 0)
    for (var i = 0; i < files.length; i++) {
      var filePath = dirPath + '/' + files[i];
      if (fs.statSync(filePath).isFile())
        fs.unlinkSync(filePath);
      else
        rmDir(filePath);
    }
  fs.rmdirSync(dirPath);
};

rmDir(company_dist);
rmDir(academic_dist);
fs.mkdirSync(company_dist);
fs.mkdirSync(academic_dist);

var companies = globby.sync(`${company_dir}*.png`)
var academic = globby.sync(`${academic_dir}*.png`)
console.log('preparing to sharpify')

var file_type = '.jpg'

// companies
for (var i = 0; i < companies.length; i++) {
	let bitmap = fs.readFileSync(companies[i]);
	let full_file_name = path.basename(companies[i]);
	let file_name = full_file_name.replace(/[.]png/g,"");
	sharp(bitmap)
	.greyscale(true)
	  .resize(100, 100)
	  .max()
	  .background('#ffffff')
	  .flatten()
	  .jpeg({
	  	quality: 70,
	  	progressive: true,
	  })
	  // .webp({
	  // 	quality: 50,
	  // 	alphaQuality: 60
	  // })
	  // .toFormat('webp')
	  .toFormat('jpeg')
		.toFile(`${company_dist}${file_name}${file_type}`)
};

// academic
for (var i = 0; i < academic.length; i++) {
	let bitmap = fs.readFileSync(academic[i]);
	let full_file_name = path.basename(academic[i]);
	let file_name = full_file_name.replace(/[.]png/g,"");
	sharp(bitmap)
	.greyscale(true)
	  .resize(100, 100)
	  .max()
	  .background('#ffffff')
	  .flatten()
	  .jpeg({
	  	quality: 70,
	  	progressive: true,
	  })
	  .toFormat('jpeg')
	  .toFile(`${academic_dist}${file_name}${file_type}`)
};

console.log('sharpified')
