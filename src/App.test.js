import { render, screen } from "@testing-library/react";
import App from "./App";

test("renders Hot reload as text inside the app", () => {
  render(<App />);
  const elementWithText = screen.getByText(/Hot reload/i);
  expect(elementWithText).toBeInTheDocument();
});
