'use client'
import { useState } from "react";
import MultiSelectDropdown from "./components/MultiSelectDropdown";
import findTalentBySkill from "./components/findTalentBySkill";
import TableComponent from "./components/PrintUsers";

export default function Home() {
  const [skill, setSkills] = useState([]);
  const [loading, setLoading] = useState(false);
  const [users, setUsers] = useState([]);
  const [result, setResult] = useState(false)

  const AvailableSkills = [
    { value: 'Figma', label: 'Figma' },
    { value: 'Flutter', label: 'Flutter' },
    { value: 'JavaScript', label: 'JavaScript' },
  ];

  const onSubmit = async () => {
    setLoading(true);
    setResult(false);
    await findTalentBySkill(skill, "search").then((data) => {
      setUsers(data);
      console.log(data);
      setResult(true);
    }).finally(() => setLoading(false));
  }

  return (
    <main>
      <div className="min-h-screen bg-gray-100 text-gray-900 flex justify-center">
        <div className="max-w-screen-xl m-0 sm:m-10 bg-white shadow sm:rounded-lg flex justify-center flex-1">
          <div className="mx-[50px] xl:w-10/12 p-6 sm:p-12">
            <div>
            </div>
            <div className="mt-12 flex flex-col items-center">
              <h1 className="text-2xl xl:text-3xl font-extrabold">
                Talentz.
              </h1>
              <h4 className="text-2xl py-[20px] xl:text-md">
                Select the skills you need
              </h4>
              <div className="h-fit m-1">
                <MultiSelectDropdown setSkills={setSkills} skills={AvailableSkills} />
              </div>
              {loading ?
                <button className="flex items-center gap-[20px] bg-green-200 h-[50px] px-[50px] mt-[30px] font-semibold" onClick={onSubmit}>
                  SEARCHING
                  <svg className="animate-spin w-5 text-black" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                </button>
                :
                <button className="bg-green-200 h-[50px] px-[50px] mt-[30px] font-semibold" onClick={onSubmit}>SEARCH</button>
              }
            </div>

            {result ?
              <div>
                <TableComponent data={users} />
              </div>
              : ""
            }
          </div>
        </div>
      </div>
    </main >
  )
}
