import { Box } from "@mui/material";
import { TeamSection } from "./sections";

function AboutPage() {
  return (
    <Box
      sx={{
        position: "fixed",
        inset: 0,
        backgroundColor: "#010205",
        overflow: "hidden",
      }}
    >
      <TeamSection />
    </Box>
  );
}

export default AboutPage;
