import React from 'react';

interface AuthenticatedLayoutProps {
  children: React.ReactNode;
}

const AuthenticatedLayout: React.FC<AuthenticatedLayoutProps> = ({ children }) => {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* You can add a header, sidebar, or other common UI elements here */}
      <main className="container mx-auto p-4">
        {children}
      </main>
      {/* You can add a footer here if needed */}
    </div>
  );
};

export default AuthenticatedLayout;