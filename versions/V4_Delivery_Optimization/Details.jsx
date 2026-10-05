import React from "react";
import {useParams} from "react-router-dom";
import {Star,Clock3} from "lucide-react";
import {courses,desc} from "./common.jsx";
export default function Details(){const{id}=useParams(),c=courses.find(x=>x[0]===id);if(!c)return <main className="container section"><h1>Course not found</h1></main>;return <main className="container section"><div className="details"><img src={c[6]} alt={c[1]} loading="lazy" decoding="async"/><div><span className="tag">{c[2]}</span><h1>{c[1]}</h1><p>{desc}</p><div className="meta large"><span><Star size={17}/>{c[5]}</span><span>{c[3]}</span><span><Clock3 size={17}/>{c[4]}</span></div><button className="btn primary">Enroll now</button></div></div></main>}
