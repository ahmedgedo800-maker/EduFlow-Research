import React,{lazy,Suspense} from "react";
import {Routes,Route} from "react-router-dom";
import {Header} from "./common.jsx";
const Home=lazy(()=>import("./Home.jsx")); const Courses=lazy(()=>import("./Courses.jsx")); const Details=lazy(()=>import("./Details.jsx")); const Dashboard=lazy(()=>import("./Dashboard.jsx")); const Profile=lazy(()=>import("./Profile.jsx"));
export default function App(){return <><Header/><Suspense fallback={<main className="container section"><h1>Loading…</h1></main>}><Routes><Route path="/" element={<Home/>}/><Route path="/courses" element={<Courses/>}/><Route path="/courses/:id" element={<Details/>}/><Route path="/dashboard" element={<Dashboard/>}/><Route path="/profile" element={<Profile/>}/></Routes></Suspense><footer><div className="container">EduFlow Research Prototype • Web Performance Study</div></footer></>}


