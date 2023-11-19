'use client'
// MultiSelectDropdown.js
import React from 'react';
import Select from 'react-select';

const MultiSelectDropdown = (props) => {

  const handleChange = (selectedOptions) => {
    props.setSkills(selectedOptions);
    console.log('Selected Options:', selectedOptions);
  };

  return (
    <div>
      <Select
        className='min-w-[200px] h-[50px] rounded-md'
        isMulti
        options={props.skills}
        onChange={handleChange}
      />
    </div>
  );
};

export default MultiSelectDropdown;
