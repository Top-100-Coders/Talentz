import { sampleData } from "./dataModel.js";

const regex = /^\s*([^\s]+)(?:\s+([^\s]+))*\s*$/i;
const nameCheck = (param, value) => {
  return [
    value.toLowerCase(),
    value.match(regex)[1].toLowerCase(),
    value.match(regex)[2].toLowerCase(),
  ].includes(param.toLowerCase().trim());
};
export const getData = (param, paramType) => {
  // if (!Array.isArray(param) && typeof paramType == "undefined") {
  //   throw new Error("second argument required");
  // }
  let data = sampleData.filter((val, index) => {
    if (Array.isArray(param)) {
      if (param.some((element) => val.skills.includes(element.value))) {
        return val;
      }
    } else {
      if (nameCheck(param, val[paramType])) {
        console.log(val[paramType].toLowerCase());
        return val;
      }
    }
  });
  return data;
};
