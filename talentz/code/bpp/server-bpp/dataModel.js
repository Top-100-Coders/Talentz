let sampleData = [
  {
    id: 1,
    name: "John Doe",
    location: "City A",
    skills: ["Figma", "Flutter", "JavaScript"],
  },
  {
    id: 2,
    name: "Jane Smith",
    location: "City B",
    skills: ["Photoshop", "React", "CSS"],
  },
  {
    id: 3,
    name: "Bob Johnson",
    location: "City C",
    skills: ["Sketch", "Vue.js", "HTML"],
  },
  {
    id: 4,
    name: "Alice Brown",
    location: "City D",
    skills: ["Adobe XD", "Angular", "Sass"],
  },
  {
    id: 5,
    name: "Charlie White",
    location: "City E",
    skills: ["InVision", "Node.js", "Bootstrap"],
  },
  {
    id: 6,
    name: "Eva Green",
    location: "City F",
    skills: ["Illustrator", "Django", "LESS"],
  },
  {
    id: 7,
    name: "Frank Black",
    location: "City G",
    skills: ["Zeplin", "Java", "TypeScript"],
  },
  {
    id: 8,
    name: "Grace Grey",
    location: "City H",
    skills: ["XD", "Express.js", "SCSS"],
  },
  {
    id: 9,
    name: "Henry Gold",
    location: "City I",
    skills: ["Sketch", "Ruby on Rails", "Vue.js"],
  },
  {
    id: 10,
    name: "Ivy Rose",
    location: "City J",
    skills: ["Figma", "Angular", "JavaScript"],
  },
  {
    id: 11,
    name: "Jack Blue",
    location: "City K",
    skills: ["Photoshop", "React", "CSS"],
  },
  {
    id: 12,
    name: "Kelly Silver",
    location: "City L",
    skills: ["InVision", "Node.js", "Bootstrap"],
  },
  {
    id: 13,
    name: "Leo Brown",
    location: "City M",
    skills: ["Illustrator", "Django", "LESS"],
  },
  {
    id: 14,
    name: "Mia Green",
    location: "City N",
    skills: ["Zeplin", "Java", "TypeScript"],
  },
  {
    id: 15,
    name: "Nathan Red",
    location: "City O",
    skills: ["XD", "Express.js", "SCSS"],
  },
  {
    id: 16,
    name: "Olivia White",
    location: "City P",
    skills: ["Sketch", "Ruby on Rails", "Vue.js"],
  },
  {
    id: 17,
    name: "Paula Black",
    location: "City Q",
    skills: ["Figma", "Angular", "JavaScript"],
  },
  {
    id: 18,
    name: "Quincy Grey",
    location: "City R",
    skills: ["Photoshop", "React", "CSS"],
  },
  {
    id: 19,
    name: "Ryan Gold",
    location: "City S",
    skills: ["InVision", "Node.js", "Bootstrap"],
  },
  {
    id: 20,
    name: "Sara Silver",
    location: "City T",
    skills: ["Illustrator", "Django", "LESS"],
  },
];

export const getData = (param,paramType) => {
  let data = [];

  sampleData.filter((val, index) => {
    if (Array.isArray(param)) {
      if (param.some((element) => val.skills.includes(element.value))) {
        return (data = [...data, val]);
      }
    } else {
      if (param === val[paramType]) {
        return (data = [...data, val]);
      }
    }
  });
  return data;
};
//console.log(getData([{ value: "Django" }, { value: "Bootstrap" }]));
