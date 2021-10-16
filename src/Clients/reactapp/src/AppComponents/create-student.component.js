// CreateStudent Component for add new student

// Import Modules
import React, { useState } from "react";
import axios from 'axios';
import StudentForm from "./StudentForm";

// CreateStudent Component
const CreateStudent = () => {

	const [formValues] = useState({ id: '', name: '', email: '' })
	// onSubmit handler
	const onSubmit = studentObject => {
		axios
		.post('http://localhost:4000/students/',studentObject)
		.then(res => {
			if (res.status === 200)
				alert('Student successfully created')
			else
				Promise.reject()})
		.catch(err => alert('Something went wrong'))
	}
		
	// Retuern student form
	return(
		<StudentForm initialValues={formValues}
		onSubmit={onSubmit}
		enableReinitialize>
		Create Student
		</StudentForm>
	)


}

// Export CreateStudent Component
export default CreateStudent
