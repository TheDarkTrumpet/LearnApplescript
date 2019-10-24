tell application "Pages"
   tell (make new document with properties {template name:"Blank"})
      set paragraph 1 to "Pages Version 4 Features"
      tell body text to insert page break
      set paragraph 2 to "Full-screen view. When your desktop is cluttered, " & ¬
            "it can be hard to focus on what you're writing."
      tell body text to insert page break
      set paragraph 3 to "Dynamic outlines. It's easier to write when " & ¬
            "your ideas are structured."
      tell body text to insert page break
      set paragraph 4 to "Mail merge with Numbers. Now it's even easier " & ¬
            "to address invitations, create invoices, personalize letters, " & ¬
            "and build mailing lists."
      tell body text to insert page break
      set paragraph 5 to "Enhanced Template Chooser. Find inspiration for " & ¬
            "your writing or design project even faster."
      tell body text to insert page break
      set paragraph 6 to "More ways to share. Share your Pages documents " & ¬
            "with anyone on a Mac or PC."
   end tell
end tell


