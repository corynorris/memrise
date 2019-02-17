{:ok, user} =
  Memrise.Accounts.Users.create_user(%{
    email: "test@123.com",
    first_name: "john",
    last_name: "doe",
    password: "password",
    password_confirmation: "password"
  })

{:ok, french_course} =
  Memrise.Courses.create_course(%{
    user_id: user.id,
    name: "French",
    description: "A course to cover the basics of French."
  })

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "Bonjour",
  back: "Hello",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "être",
  back: "to be; being",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "avoir",
  back: "to have",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "je",
  back: "I",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "de",
  back: "of, from, by, than, in, with",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "ne",
  back: "not",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "pas",
  back: "not; step, pace",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "le",
  back: "the; him, it (refering to a masculine singular noun)",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "la",
  back: "the; her, it (refering to a feminine singular noun)",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "tu",
  back: "you",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "vous",
  back: "you, yourself",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "il",
  back: "he, it",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "et",
  back: "and",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "à",
  back: "in, to, with",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "un",
  back: "a, an; one (used before a masculine singular noun)",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "le",
  back: "the (used instead of ''le'' or ''la'' before nouns that begin with a vowel)",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "qui",
  back: "who, whom; that, which",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "aller",
  back: "to go",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "les",
  back: "the; them (referring to a plural noun)",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "en",
  back: "in, into, to, as",
  course_id: french_course.id
})

Memrise.Courses.create_card(%{
  user_id: user.id,
  front: "ça",
  back: "this, that",
  course_id: french_course.id
})

{:ok, admin} =
  Memrise.Accounts.Users.create_user(%{
    email: "admin@123.com",
    first_name: "admin",
    last_name: "admin",
    password: "password",
    password_confirmation: "password"
  })

{:ok, spanish_course} =
  Memrise.Courses.create_course(%{
    user_id: admin.id,
    name: "Spanish",
    description: "A course to cover the basics of Spanish."
  })

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "Bonjour",
  back: "Hello",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "de",
  back: "of; from",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "la",
  back: " the; third person feminine singular pronoun",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "que",
  back: "that, which",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "el",
  back: "the",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "en",
  back: "in, on",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "y",
  back: "and",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "a",
  back: "to, at",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "los",
  back: " the; third person masculine direct object",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "se",
  back: "-self, oneself (reflexive)",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "del",
  back: "from the",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "las",
  back: " the; third person feminine direct object",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "un",
  back: "a, an",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "por",
  back: "by, for, through",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "con",
  back: "with",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "no",
  back: "no; not",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "una",
  back: "a, an, one",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "su",
  back: "his/her/its/your",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "para",
  back: "for, to, in order to",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "es",
  back: "is",
  course_id: spanish_course.id
})

Memrise.Courses.create_card(%{
  user_id: admin.id,
  front: "al",
  back: "to the",
  course_id: spanish_course.id
})
