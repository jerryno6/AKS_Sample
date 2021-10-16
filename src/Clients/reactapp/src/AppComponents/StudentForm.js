import React from "react";
import * as Yup from "yup";
import { Formik, Form, Field, ErrorMessage } from "formik";
import { FormGroup, Button } from "react-bootstrap";

const StudentForm = (props) => {
const validationSchema = Yup.object().shape({
	name: Yup.string()
		.required("Rquired"),
	email: Yup.string()
		.email("You have enter an invalid email address")
		.required("Rquired"),
	id: Yup.number()
		.positive("Invalid id")
		.integer("Invalid id")
		.required("Rquired"),
});
console.log(props);

return (
	<div className="form-wrapper">
	<Formik {...props} validationSchema={validationSchema}>
		<Form>
			<FormGroup>
				<label htmlFor="no">ID</label>
				<Field name="id" type="number" className="form-control" />
				<ErrorMessage
					name="id"
					className="d-block invalid-feedback"
					component="span" />
			</FormGroup>
			<FormGroup>
				<label htmlFor="name">Name</label>
				<Field name="name" type="text" className="form-control" />
				<ErrorMessage
					name="name"
					className="d-block invalid-feedback"
					component="span" />
			</FormGroup>
			<FormGroup>
				<label htmlFor="email">Email</label>
				<Field name="email" type="text" className="form-control" />
				<ErrorMessage
					name="email"
					className="d-block invalid-feedback"
					component="span" />
			</FormGroup>

			<Button variant="danger" size="lg"
				padding="5,5,5,5"
				block="block" type="submit">
				{props.children}
			</Button>

		</Form>
	</Formik>
	</div>
);
};

export default StudentForm;
