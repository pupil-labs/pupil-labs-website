#!/usr/local/env node

const fs = require('fs');
const path = require('path');
const globby = require('globby')

// var raw_json = fs.readFileSync('./customer_list.json');
var raw_json = fs.readFileSync('../../contents/home/customer_list.json');
var parseJson = JSON.parse(raw_json)
var commercial = parseJson.commercial
var academic = parseJson.academic
var arrayAll = commercial.concat(academic)

function write_base64(b64_map) {
	for (var i = 0; i < arrayAll.length; i++) {
		var array_obj = arrayAll[i]
		array_obj.img = ! b64_map[array_obj.uid] ? "" : b64_map[array_obj.uid];
	};
	return parseJson;
};

console.log('generating base64')
var suf = 'jpg'
var images = globby.sync(`../../contents/media/images/home/customers/**/dist/*.${suf}`)
var b64_map = {};

for (var i = 0; i < images.length; i++) {
	let file_name = path.basename(images[i], `.${suf}`)
	let bitmap = fs.readFileSync(images[i]);
	let b64string = Buffer(bitmap).toString('base64')
	b64_map[file_name] = `data:image/${suf};base64,${b64string}`;
};

var jsonb64 = JSON.stringify(write_base64(b64_map), null, 2);
// fs.writeFile('../../contents/home/customer_list_img.json', jsonb64);
fs.writeFile('../../contents/home/customer_list.json', jsonb64);

console.log('base64 generated')